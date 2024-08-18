'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "a3a73239ee9235e96dacaddc697b07ba",
"icons/Icon-192.png": "52d69e99c5c5d223cfd3b3f1550a645d",
"icons/Icon-512.png": "a3a73239ee9235e96dacaddc697b07ba",
"icons/Icon-maskable-192.png": "52d69e99c5c5d223cfd3b3f1550a645d",
"assets/FontManifest.json": "9b6824d15eb4e828a9d7f8ed9664169e",
"assets/AssetManifest.bin.json": "fc50af7f606a757943710ee8dda01653",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/icons/svg/main_categories/fertilizer_icon.svg": "1c66dfcbe637e30b7032dadb72f3fca7",
"assets/assets/icons/svg/main_categories/soil_icon.svg": "4c0037595fa1c0cead549e23076638e1",
"assets/assets/icons/svg/main_categories/decorations_icon.svg": "9060bc951c5b4efc28b38d72544a489f",
"assets/assets/icons/svg/main_categories/plants_icon.svg": "7718aee34048bb032eeb9f41ca77d41e",
"assets/assets/icons/svg/main_categories/seeds_icon.svg": "e03ccacfc879c85d7bca159f73eea0aa",
"assets/assets/icons/svg/main_categories/tools_icon.svg": "383d505b49638187bb5d209cf21e1030",
"assets/assets/icons/svg/main_categories/pesticides_icon.svg": "760cdf9c2f3192866cd48857de5ed3e6",
"assets/assets/icons/svg/main_categories/containers_icon.svg": "50c9509495af0fb2da9a6975f575cd3f",
"assets/assets/icons/svg/main_categories/seedlings_icon.svg": "a61aff99f70d4a56f725fb306c359ea7",
"assets/assets/icons/png/sale.png": "e45a9d9bbd9826b8402cfc515a0c4140",
"assets/assets/icons/png/social_logos.png": "147d14690a66bf07037388ccde4cf058",
"assets/assets/icons/png/payment_logos.png": "8b71806cfab2914076a23c6b5a63e309",
"assets/assets/fonts/Righteous-Regular.ttf": "77fa00996ecb4104c7880b8749c7c4e0",
"assets/assets/fonts/Itim-Regular.ttf": "ea9ed37af3e95dd1629a9581ceb2c4ed",
"assets/assets/fonts/Quicksand-Bold.ttf": "0738679df4cf4e566f60343830da7bfa",
"assets/assets/fonts/Quicksand-Regular.ttf": "216d43ee8707910af457af569eda1dec",
"assets/assets/fonts/CutiveMono-Regular.ttf": "f33327cdc7c1c759c638ac5860736cbd",
"assets/assets/fonts/Quicksand-SemiBold.ttf": "c82b184bf7450e14adccb7b0d6117474",
"assets/assets/fonts/Quicksand-Light.ttf": "188ca708e4cbbbe3837c3d904b8eeb61",
"assets/assets/fonts/Quicksand-Medium.ttf": "865b25e449878b6b4d1f9e098ff2f510",
"assets/assets/images/earthly.png": "1b3cdf6f3046f73cbea3f4f56ce4c2eb",
"assets/assets/images/products/seedlings_2.jpg": "70f9af827654b329f36b7a812bba5642",
"assets/assets/images/products/seeds_2.jpg": "a5c6ec85ceb51d240af760ae103c750b",
"assets/assets/images/products/plants_4.jpg": "60c6667c9130a0178f1e03c48356ac1a",
"assets/assets/images/products/plants_1.jpg": "620148f145e188ab27da4ddca02d3d81",
"assets/assets/images/products/garden_tools_2.jpg": "e05327553c206100d581d9cb37539b9c",
"assets/assets/images/products/garden_tools_3.jpg": "e2d8ef3147d404557049d16c1617f6f1",
"assets/assets/images/products/pots_4.jpg": "26e6b334f68274c4372013121bc5efd1",
"assets/assets/images/products/fertilizer_2.jpg": "f0270775a08152eb7027940bf1e1d483",
"assets/assets/images/products/pots_3.jpg": "32206ec28c14e82c50f9e537effb24b8",
"assets/assets/images/products/seedlings_1.jpg": "fc42175b95eef73f81d00db64cbca56d",
"assets/assets/images/products/pots_1.jpg": "424f1a84e755c34240151ce2912d86cc",
"assets/assets/images/products/seedlings_3.jpg": "72dcc25b27eabebded83202977f8e6ec",
"assets/assets/images/products/fertilizer_1.jpg": "11187ebe429522399223833b5c31f97c",
"assets/assets/images/products/pesticide_2.jpg": "6e6f5a7c1e6d3e5c5e95ae65bb904d7c",
"assets/assets/images/products/seeds_1.jpg": "3fa2b21590c6fe1fb5439b199e95e620",
"assets/assets/images/products/plants_2.jpg": "05d1b4c24306c60693f4b9fdf91fb6ad",
"assets/assets/images/products/pesticide_1.jpg": "8a75df2f7fab3c81e7ff8896268eb546",
"assets/assets/images/products/pots_2.jpg": "174948a27726d5efe15986f96a73733e",
"assets/assets/images/products/plants_3.jpg": "5f0b33eed39f71fdc535ff5a634dae56",
"assets/assets/images/products/pesticide_4.jpg": "35d8fb6e730ed913601d6a3d14b77443",
"assets/assets/images/products/pesticide_3.jpg": "b587f082d5ec98b55ed509ee3f7ee18e",
"assets/assets/images/products/garden_tools_1.jpg": "f824d6be5a126d0ebd8c0002602785a9",
"assets/assets/images/promos/main_promos/summer_sale.jpg": "5614ff9af8149cec106704e0abcd631b",
"assets/assets/images/promos/main_promos/landscape_architect.jpg": "4fc94e060b5cb2b29bebbefc9b4dd9ee",
"assets/assets/images/promos/main_promos/garden_plan.jpg": "50342c72179e1f11a5d49105ae34ad0c",
"assets/assets/images/promos/main_promos/garden_assitance.jpg": "c70600a1d3af12386dddbc45ef9be77b",
"assets/assets/images/promos/main_promos/grow_up_your_garden.jpg": "97f8d10bcdf80c61ddcebcb6ef3d907e",
"assets/assets/images/promos/side_promos/gardening_books.jpg": "0e71faba6fd1dc0507e80cc659815edd",
"assets/assets/images/promos/side_promos/planting_campaign.jpg": "b2f96a3022354131e003c8a8139a12f5",
"assets/assets/images/promos/side_promos/garden_tools.jpg": "58108236a4c6f39d91da1d5965344dc1",
"assets/assets/images/promos/side_promos/pots_sale_vertical.jpg": "0febc9ef00fbe27040d0c0ba9a31e958",
"assets/assets/images/promos/side_promos/pot_sale_clean.jpg": "743368030e71f51bb62db12475fa13a4",
"assets/assets/images/popups/planting_campaign.jpg": "b2f96a3022354131e003c8a8139a12f5",
"assets/fonts/MaterialIcons-Regular.otf": "f49fe4ce13527fa97edf2ba915ca840b",
"assets/AssetManifest.bin": "162da05605a98f1c361f5e8515a065f5",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "3759b2f7a51e83c64a58cfe07b96a8ee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/AssetManifest.json": "c65d4c5d4d94409aa11b6e3dbf1603bf",
"assets/NOTICES": "7136301b3a59d800aff6ccf344d403b9",
"index.html": "06c2b1c7a6a3f4209576310ce367f0fa",
"/": "06c2b1c7a6a3f4209576310ce367f0fa",
"main.dart.js": "d8b31a051f398461e41aa75595bc1384",
"favicon.png": "b45c22d625cae74f7418c5d72ec39b24",
"version.json": "548fa4499b120cdae37091a250888f4b",
"flutter_bootstrap.js": "b6a6e070f99411e05e621e5830d6edd9",
"favicon.ico": "137013b94d94a6b2e612abf81dfa32f7",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"manifest.json": "944fc8416df43ef12ac00ce34cf3fb26",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
