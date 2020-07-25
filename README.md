# endpoint-check

### Usage

kubectl create -f deploy.yml

POST localhost:3000/api/ping

```json
{
  "urls": [
    "https://www.docker.com/",
    "http://http-kit.org/",
    "http://google.com/",
    "https://kubernetes.io/",
    "https://slack.com/"
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
]
```

### Download and Install

======================Docker=====================

docker pull tedpark/endpoint-check

docker run -p 3000:3000 tedpark/endpoint-check

=================================================

https://github.com/technomancy/leiningen

brew install leiningen

0. lein new luminus endpoint-check +http-kit +swagger +service

1. lein run

2. you can connect swagger url -> localhost:3000/swagger-ui

### Distributions

0. lein uberjar

1. sudo docker build -t ping-image .

2. sudo docker run -it --rm -p 3000:3000 --name ping-container ping-image

   or

   sudo docker run -d --rm -p 3000:3000 --name ping-container ping-image

# PingElixir

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Start Phoenix endpoint with `mix phx.server`

### Usage

kubectl create -f deploy.yml

POST localhost:4000/api/ping

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

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
