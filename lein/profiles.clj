{:user {:plugins [
                 ;; [lein-localrepo "0.5.3"]
                  ]

        :dependencies [[org.clojure/clojure "1.10.0"]
                       ;; This is pulling in google closure and breaking protoc builds.
                       ; [com.bhauman/rebel-readline "LATEST"]
                       ]
        ; :aliases {"rebl" ["run" "-m" "rebel-readline.main/-main"]}
        }

 ;; :repl {:plugins [[cider/cider-nrepl "0.19.0"]
 ;;                  [nrepl "0.5.3"]
 ;;                  [refactor-nrepl "2.4.0"]]}
 }
