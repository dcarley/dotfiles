{:user {:dependencies [
                       [lambdaisland/kaocha "0.0-554" :exclusions [org.clojure/tools.cli]]
                       ]
        :aliases {
                  "ktest" ["run" "-m" "kaocha.runner" "--reporter" "kaocha.report.progress/report"]
                  }
        }
 :repl {:dependencies [
                       [nrepl "0.6.0"]
                       ]
        :plugins [
                  [cider/cider-nrepl "0.23.0-SNAPSHOT"]
                  [refactor-nrepl "2.5.0-SNAPSHOT"]
                  ]
        }
 }
