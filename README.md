# Clojure & Elixir Concurrent Ping Check

```Elixir
  def call_apis_async(urls) do
    urls
    |> Task.async_stream(&HTTPoison.get/1)
    |> Enum.into([], fn {:ok, res} -> [res] end)
  end


  def create(conn, %{"urls" => urls}) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(Enum.map(call_apis_async(urls), fn num -> %{"url" => num[:ok].request_url, "status" => num[:ok].status_code} end)))
  end
```

```Clojure
   ["/ping"
    {:post {:parameters {:body {:urls [string?]}}
            :handler (fn [{{{:keys [urls]} :body} :parameters}] (ok (let [url urls  futures (doall (map http/get url))]
                                                                      (def responseStatus (atom []))
                                                                      (doseq [resp futures]
                                                                        (swap! responseStatus conj {:url (-> @resp :opts :url) :status (:status @resp)})
                                                                        (println (-> @resp :opts :url) " status: " (:status @resp))) @responseStatus)))}}]])
```

### Usage Elixir

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Start Phoenix endpoint with `mix phx.server`

POST http://localhost:4000/api/ping

```json
{
  "urls": [
    "https://google.com/",
    "https://github.com/",
    "https://twitter.com/",
    "https://www.docker.com/",
    "http://google.com/",
    "https://kubernetes.io/",
    "https://slack.com/",
    "https://meetlive.io",
    "https://okrdo.it",
    "https://stackoverflow.com",
    "https://luminusweb.com/",
    "https://clojure.org/",
    "https://elixir-lang.org/",
    "https://www.amazon.com/",
    "https://www.facebook.com/",
    "https://google.com/",
    "https://github.com/",
    "https://twitter.com/",
    "https://www.docker.com/",
    "http://google.com/",
    "https://kubernetes.io/",
    "https://slack.com/",
    "https://meetlive.io",
    "https://okrdo.it",
    "https://stackoverflow.com",
    "https://luminusweb.com/",
    "https://clojure.org/",
    "https://elixir-lang.org/",
    "https://www.amazon.com/",
    "https://www.facebook.com/",
    "https://google.com/",
    "https://github.com/",
    "https://twitter.com/",
    "https://www.docker.com/",
    "http://google.com/",
    "https://kubernetes.io/",
    "https://slack.com/",
    "https://meetlive.io",
    "https://okrdo.it",
    "https://stackoverflow.com",
    "https://luminusweb.com/",
    "https://clojure.org/",
    "https://elixir-lang.org/",
    "https://www.amazon.com/",
    "https://www.facebook.com/"
  ]
}
```

will Return

```json
[
  {
    "url": "https://www.docker.com/",
    "status": 200
  },
  {
    "url": "http://www.http-kit.org/",
    "status": 200
  },
  {
    "url": "http://www.google.co.kr/?gfe_rd=cr&dcr=0&ei=ovy8Wse0Bcrd8Aev9oioBQ",
    "status": 200
  },
  {
    "url": "https://kubernetes.io/",
    "status": 200
  },
  {
    "url": "https://slack.com/",
    "status": 200
  }
  ...
  ...
  ...
]
```

### Usage Clojure

To start your Clojure server:

1. lein run

POST http://localhost:3000/api/ping

```json
{
  "urls": [
    "https://google.com/",
    "https://github.com/",
    "https://twitter.com/",
    "https://www.docker.com/",
    "http://google.com/",
    "https://kubernetes.io/",
    "https://slack.com/",
    "https://meetlive.io",
    "https://okrdo.it",
    "https://stackoverflow.com",
    "https://luminusweb.com/",
    "https://clojure.org/",
    "https://elixir-lang.org/",
    "https://www.amazon.com/",
    "https://www.facebook.com/",
    "https://google.com/",
    "https://github.com/",
    "https://twitter.com/",
    "https://www.docker.com/",
    "http://google.com/",
    "https://kubernetes.io/",
    "https://slack.com/",
    "https://meetlive.io",
    "https://okrdo.it",
    "https://stackoverflow.com",
    "https://luminusweb.com/",
    "https://clojure.org/",
    "https://elixir-lang.org/",
    "https://www.amazon.com/",
    "https://www.facebook.com/",
    "https://google.com/",
    "https://github.com/",
    "https://twitter.com/",
    "https://www.docker.com/",
    "http://google.com/",
    "https://kubernetes.io/",
    "https://slack.com/",
    "https://meetlive.io",
    "https://okrdo.it",
    "https://stackoverflow.com",
    "https://luminusweb.com/",
    "https://clojure.org/",
    "https://elixir-lang.org/",
    "https://www.amazon.com/",
    "https://www.facebook.com/"
  ]
}
```

will Return

```json
[
    {
        "url": "https://www.docker.com/",
        "status": 200
    },
    {
        "url": "http://www.http-kit.org/",
        "status": 200
    },
    {
        "url": "http://www.google.co.kr/?gfe_rd=cr&dcr=0&ei=ovy8Wse0Bcrd8Aev9oioBQ",
        "status": 200
    },
    {
        "url": "https://kubernetes.io/",
        "status": 200
    },
    {
        "url": "https://slack.com/",
        "status": 200
    }
    ...
    ...
    ...
]
```
