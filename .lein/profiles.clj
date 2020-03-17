{:user {:dependencies [
                       [lambdaisland/kaocha "0.0-554" :exclusions [org.clojure/tools.cli]]
                       ]
        :aliases {
                  "ktest" ["run" "-m" "kaocha.runner" "--reporter" "kaocha.report.progress/report"]
                  }
        :plugins [
                  [lein-pprint "1.2.0"]
                  [circleci/deps-plus "0.1.0-SNAPSHOT"]
                  ]
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
