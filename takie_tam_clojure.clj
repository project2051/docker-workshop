Skip to content
 This repository
Explore
Gist
Blog
Help
mieciu mieciu
 
26  Watch 
  Star 878
 Fork 234mmcgrana/ring
 branch: master  ring / ring-devel / src / ring / middleware / stacktrace.clj
James Reevesweavejester on Apr 11, 2012 Removed unnecessary var
4 contributors Mark McGranaghanJames ReevesNate YoungSeth Buntin
90 lines (80 sloc)  2.707 kb RawBlameHistory   
(ns ring.middleware.stacktrace
  "Catch exceptions and render web and log stacktraces for debugging."
  (:require [clojure.java.io :as io])
  (:use hiccup.core
        hiccup.page
        clj-stacktrace.core
        clj-stacktrace.repl
        ring.util.response))

(defn wrap-stacktrace-log
  "Wrap a handler such that exceptions are logged to *err* and then rethrown."
  [handler]
  (fn [request]
    (try
      (handler request)
      (catch Exception ex
        (let [msg (str "Exception: " (pst-str ex))]
          (.println *err* msg)
          (throw ex))))))

(defn- style-resource [path]
  (html [:style {:type "text/css"} (slurp (io/resource path))]))

(defn- elem-partial [elem]
  (if (:clojure elem)
    [:tr
      [:td.source (h (source-str elem))]
      [:td.method (h (clojure-method-str elem))]]
    [:tr
      [:td.source (h (source-str elem))]
      [:td.method (h (java-method-str elem))]]))

(defn- html-exception [ex]
  (let [ex-seq    (iterate :cause (parse-exception ex))
        exception (first ex-seq)
        causes    (rest ex-seq)]
    (html5
      [:head
        [:title "Ring: Stacktrace"]
        (style-resource "ring/css/stacktrace.css")]
      [:body
        [:div#exception
          [:h3.info (h (str ex))]
          [:table.trace
            [:tbody (map elem-partial (:trace-elems exception))]]]
        (for [cause causes :while cause]
          [:div#causes
           [:h3.info "Caused by: "
                    (h (.getName (:class cause))) " "
                    (h (:message cause))]
           [:table.trace
             [:tbody (map elem-partial (:trimmed-elems cause))]]])])))

(defn- js-ex-response [e]
  (-> (response (pst-str e))
      (status 500)
      (content-type "text/javascript")))

(defn- html-ex-response [ex]
  (-> (response (html-exception ex))
      (status 500)
      (content-type "text/html")))

(defn- ex-response
  "Returns a response showing debugging information about the exception.
  Currently supports delegation to either js or html exception views."
  [req ex]
  (let [accept (get-in req [:headers "accept"])]
    (if (and accept (re-find #"^text/javascript" accept))
      (js-ex-response ex)
      (html-ex-response ex))))

(defn wrap-stacktrace-web
  "Wrap a handler such that exceptions are caught and a helpful debugging
   response is returned."
  [handler]
  (fn [request]
    (try
      (handler request)
      (catch Exception ex
        (ex-response request ex)))))

(defn wrap-stacktrace
  "Wrap a handler such that exceptions are caught, a corresponding stacktrace is
  logged to *err*, and a helpful debugging web response is returned."
  [handler]
  (-> handler
      wrap-stacktrace-log
      wrap-stacktrace-web))
Status API Training Shop Blog About © 2014 GitHub, Inc. Terms Privacy Security Contact 
