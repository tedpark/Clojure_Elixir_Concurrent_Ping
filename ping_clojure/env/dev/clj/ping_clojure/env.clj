(ns ping-clojure.env
  (:require
    [selmer.parser :as parser]
    [clojure.tools.logging :as log]
    [ping-clojure.dev-middleware :refer [wrap-dev]]))

(def defaults
  {:init
   (fn []
     (parser/cache-off!)
     (log/info "\n-=[ping_clojure started successfully using the development profile]=-"))
   :stop
   (fn []
     (log/info "\n-=[ping_clojure has shut down successfully]=-"))
   :middleware wrap-dev})
