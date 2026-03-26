// KLC Management Library
//
// License AGPL-3.0 / KLPL-1.0
// Author: Kelvin Shadewing
//
// For use in fetching and editing KLC manifest files.

function klcVersionSatisfies(version, constraint) {
	if (constraint == null || constraint == "") return true;

	if (constraint == version) return true;

	// ^major
	if (constraint.len() > 0 && constraint[0] == '^') {
		local major = constraint.slice(1).split(".")[0];
		return version.split(".")[0] == major;
	}

	// >=
	if (constraint.len() > 1 && constraint.slice(0, 2) == ">=") {
		local minor = constraint.slice(2);
		return klcVersionCompare(version, minor) >= 0;
	}

	return false;
}

function klcVersionCompare(a, b) {
	local pa = a.split(".");
	local pb = b.split(".");

	for (local i = 0; i < max(pa.len(), pb.len()); i++) {
		local va = i < pa.len() ? pa[i].tointeger() : 0;
		local vb = i < pb.len() ? pb[i].tointeger() : 0;

		if (va < vb) return -1;
		if (va > vb) return 1;
	}
	return 0;
}

function klcLoadIndexes(config) {
	local indexes = [];

	foreach (url in config.indexes) {
		local data = curlGet(url);
		indexes.append(jsonRead(data));
	}

	return indexes;
}

function klcResolveModule(id, constraint, indexes) {
	local candidates = [];

	foreach (index in indexes) {
		foreach (mod in index.modules) {
			if (mod.id == id) {
				foreach (v in mod.versions) {
					if (klcVersionSatisfies(v.version, constraint)) {
						candidates.append(v);
					}
				}
			}
		}
	}

	if (candidates.len() == 0) {
		throw "Module not found: " + id;
	}

	// sort ascending
	candidates.sort(function (a, b) {
		return klcVersionCompare(a.version, b.version);
	});

	return candidates[candidates.len() - 1];
}

function klcResolveRecursive(id, constraint, indexes, resolved) {
	if (resolved.rawin(id)) return;

	local entry = klcResolveModule(id, constraint, indexes);

	local module = {
		id = id,
		version = entry.version,
		url = entry.url,
		hash = entry.rawin("hash") ? entry.hash : null,
		dependencies = []
	};

	resolved[id] <- module;

	// Fetch metadata
	local metaStr = curlGet(entry.url);
	local meta = jsonRead(metaStr);

	if (meta.rawin("dependencies")) {
		foreach (dep in meta.dependencies) {
			local depId = dep.id;
			local depVersion = dep.rawin("version") ? dep.version : null;

			klcResolveRecursive(depId, depVersion, indexes, resolved);

			module.dependencies.append(depId);
		}
	}
}

function klcGenerateLockfile(project, indexes) {
	local resolved = {};

	if (project.rawin("dependencies")) {
		foreach (dep in project.dependencies) {
			local id = dep.id;
			local constraint = dep.rawin("version") ? dep.version : null;

			klcResolveRecursive(id, constraint, indexes, resolved);
		}
	}

	local lockfile = {
		schema = "1.0",
		generated = time(),
		modules = resolved
	};

	fileWrite("klc.lock.json", jsonWrite(lockfile));
	return lockfile;
}
