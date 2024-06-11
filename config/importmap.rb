# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true # @5.3.3
pin "@popperjs/core", to: "@popperjs--core.js", preload: true # @2.11.8
# pin "stripe" # @15.9.0
# pin "#util.inspect.js" # @2.0.1
# pin "call-bind/callBound", to: "call-bind--callBound.js" # @1.0.7
# pin "define-data-property" # @1.1.4
# pin "es-define-property" # @1.0.0
# pin "es-errors" # @1.3.0
# pin "es-errors/eval", to: "es-errors--eval.js" # @1.3.0
# pin "es-errors/range", to: "es-errors--range.js" # @1.3.0
# pin "es-errors/ref", to: "es-errors--ref.js" # @1.3.0
# pin "es-errors/syntax", to: "es-errors--syntax.js" # @1.3.0
# pin "es-errors/type", to: "es-errors--type.js" # @1.3.0
# pin "es-errors/uri", to: "es-errors--uri.js" # @1.3.0
# pin "function-bind" # @1.1.2
# pin "get-intrinsic" # @1.2.4
# pin "gopd" # @1.0.1
# pin "has-property-descriptors" # @1.0.2
# pin "has-proto" # @1.0.3
# pin "has-symbols" # @1.0.3
# pin "hasown" # @2.0.2
# pin "object-inspect" # @1.13.1
# pin "qs" # @6.12.1
# pin "set-function-length" # @1.2.2
# pin "side-channel" # @1.0.6
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@3.1.2/dist/mapbox-gl.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
pin "flatpickr", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/esm/index.js"
