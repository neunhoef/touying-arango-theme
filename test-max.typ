// My first demo presentation

#import "@preview/touying:0.6.1": *
#import "arango-theme.typ": *

// Initialize the theme
#show: arango-theme.with(aspect-ratio: "16-9")

// Title Slide

#title-slide(
  title: [My first Demo Presentation],
  subtitle: [I am trying typst with touying],
  author: [Max Neunhöffer – Chief Architect of the Core DB],
  date: [25 February 2026],
)

// Section divider

#section-slide(
  title: [First a few sample slides],
  subtitle: [It is important for me to write in plain text!]
)

// Regular content slide (== heading creates a new slide)

== Slide 1

Normal #red[text appears] like this.

Here is *bold text*.

Here is _italic text_.

Here is an #blue[enumeration]:

- Siloed databases prevent cross-system reasoning
- Stale data leads to hallucinations at scale
- No single source of truth for enterprise context
- Manual ETL pipelines cannot keep up with agentic workloads

 1. Erstens
 2. Zweitens
 3. Drittens

// Card layout (2 columns)

== Two arguments

#grid(
  columns: (1fr, 1fr),
  column-gutter: 16pt,
  arango-card(title: "Core DB")[
    Combine *graph*, *document*, and *key-value* in a single query.

    - #red[Native] graph traversals
    - AQL query #blue[language]
    - Vector search built in
  ],
  arango-card(title: "Platform")[
    A micro-service system

    - Kubernetes-native deployment
    - Role-based access control
    - Horizontal scalability
  ],
)

// Tables

== Architecture Layers

#table(
  columns: (1.2fr, 1.2fr, 2fr),
  [*Heading1*],    [*Heading2*],         [*Heading3*],
  [Content 1],     [Content 2],          [Content 3],
)

// Code example slide

== Code Example

Connect and query the knowledge graph:

```python
from arango import ArangoClient

client = ArangoClient(hosts="http://localhost:8529")
db = client.db("enterprise", username="root")

result = db.aql.execute("""
  FOR v, e IN 1..3 OUTBOUND 'customers/acme'
    GRAPH 'supply_chain'
    RETURN { node: v.name, rel: e.type }
""")
```

// Two-column text slide

== Two Perspectives

#grid(
  columns: (1fr, 1fr),
  column-gutter: 40pt,
  [
    === For Developers

    - Native multi-model queries
    - GraphQL & REST APIs
    - SDKs: Python, JS, Java, Go, *Rust*, C++
    - Kubernetes-native deployment
  ],
  [
    === For Business

    - Real-time data freshness
    - Compliance-ready audit trails
    - Role-based access control
    - Visual graph exploration
  ],
)

// Section divider

#section-slide(
  title: [Quotes],
  subtitle: [From industry leaders],
)

// Quote slide

== My own Quote

#arango-quote(
  author: [Charles Leedham-Greene],
  role: [Maths Guru],
)[
  "Isn't it all a lot of fun?"
]

// Numbered steps slide

== Next Steps

#v(8pt)

#arango-step(
  number: 1,
  title: [Make slides],
  description: [Use typst for it],
)

#v(8pt)

#arango-step(
  number: 2,
  title: [Make more slides],
  description: [For our Indian friends],
)

#v(8pt)

#arango-step(
  number: 3,
  title: [Make even more slides],
  description: [To be used next week],
)

// Image embed example

#grid(
  columns: (1fr, 1fr),
  column-gutter: 24pt,
  [
    The platform provides a *unified view* of your enterprise data.

    - Graph + Document + Key-Value
    - Single query language (AQL)
    - Built-in vector search
  ],
  image("arango-logo-stack.png", width: 100%),
)

// Closing slide

#closing-slide(
  title: [Thank You],
  subtitle: [And have fun with ArangoDB!]
)
