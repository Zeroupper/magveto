'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "23986af76fa7aa55e1564ba84ad280ae",
"assets/FontManifest.json": "8626bb1c705cccba10a8e8a03ff9f1e1",
"assets/assets/images/church_on_the_hill.png": "7ccf4fe9fdbd59bd50e626967b23ace1",
"assets/assets/images/profil.png": "e22b6726f3ad33b28070e8ae56d5af7a",
"assets/assets/images/big_group.jpg": "6d1cb0ba879e1f07efd91bb1bf66de0e",
"assets/assets/images/small_group.jpg": "32b6fc67a901eb573fba3fc8f3068d1d",
"assets/assets/images/praise.png": "1d03ce4e3cc6eb7d187f6bf19d6ed45b",
"assets/assets/images/contact_us.png": "2347734efeaa185f9ac09ee87123c0b6",
"assets/assets/icons/guitar.svg": "fec16995c57fd56c2ff2da9736ede228",
"assets/assets/icons/family_friendly.svg": "0fb93df377ebae7bfbed745fbad41349",
"assets/assets/icons/contact_us.svg": "6984792ae508e01192856ad8500e998d",
"assets/assets/icons/child_friendly.svg": "bb417bfd1e6dcf51712f490168425a93",
"assets/assets/icons/musical_note.svg": "a69d41ce4f8faee642d0307bb1a83e0f",
"assets/assets/icons/catholic.svg": "7d3eca66da19d740d1b7ef61aa8739fa",
"assets/assets/icons/new_friends.svg": "54ecbe137110eb4466a9de708a45e62b",
"assets/assets/icons/night_tour.svg": "28545514d94960b0b5f4e7b05437bc71",
"assets/assets/icons/singing.svg": "b306689d25132087ad4db1709f4a3fb6",
"assets/assets/icons/vigil.svg": "e6db989d1f0197e2ac963f790a37af3d",
"assets/assets/icons/cd.svg": "8a47833fca0242a2d7c449ddd0930bdf",
"assets/assets/fonts/CabinSketch-Regular.ttf": "a9f34a6a70db50327f2946e00a3597f0",
"assets/assets/fonts/CabinSketch-Bold.ttf": "eb9b5bf0b044be18d0ff7fbb6b0e2c74",
"assets/assets/logo/magveto_logo.png": "67a2814af434a6a2314c52d0ef1637f7",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/MaterialIcons-Regular.otf": "9de2ec35a4d74ea667fdd09b80da3116",
"assets/NOTICES": "0e6aaac52f44ee05919e65aa3ab3a400",
"assets/AssetManifest.json": "ec16f12b7cbce52ed08ee022f7f40501",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "fc263664f3d21ea96973dae9adcf253b",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"manifest.json": "e007663e81c6497601e747a749711b6c",
"index.html": "af5abb9d8c26aa07965de29d8b908e3c",
"/": "af5abb9d8c26aa07965de29d8b908e3c",
"main.dart.js": "42adf4f25ba94942960e445655166973",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
