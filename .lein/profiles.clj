{:user {:dependencies [
                       [lambdaisland/kaocha "0.0-554" :exclusions [org.clojure/tools.cli]]
                       ]
        :aliases {
                  "ktest" ["run" "-m" "kaocha.runner" "--reporter" "kaocha.report.progress/report"]
                  }
        }
 }
