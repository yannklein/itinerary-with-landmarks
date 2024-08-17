# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@3.1.2/dist/mapbox-gl.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
pin "deep-assign", to: "https://ga.jspm.io/npm:deep-assign@2.0.0/index.js"
pin "is-obj", to: "https://ga.jspm.io/npm:is-obj@1.0.1/index.js"
pin "lodash/isPlainObject", to: "https://ga.jspm.io/npm:lodash@4.17.21/isPlainObject.js"
pin "polyline", to: "https://ga.jspm.io/npm:polyline@0.2.0/src/polyline.js"
pin "symbol-observable", to: "https://ga.jspm.io/npm:symbol-observable@1.2.0/lib/index.js"
