# contracts

All hungover contracts such as openapi, asyncapi or data product specifications

## Structure

```text
project
│   README.md
│
└───domain01
│   │   README.md
│   │   Requirements
│   │   DomainModel
│   └───api
│       │   domain01.oas.0.1.yml
│       │   domain01_oas_0_1.html
│       │   ...
│   └───events
│       │   domain01.asyncapi.0.1.yml
│       │   domain01_asyncapi_0_1.html
│       │   ...
│   └───dataproduct
│       │   domain01.datacontract.0.1.yml
│       │   domain01.datacontract.0.1.html
│       │   ...
│
└───domain02
│   │   README.md
│   │   Requirements
│   │   DomainModel
│   └───api
│       │   domain02.oas.0.1.yml
│       │   domain02_oas_0_1.html
│       │   ...
│   └───events
│       │   domain02.asyncapi.0.1.yml
│       │   domain02_asyncapi_0_1.html
│       │   ...
│   └───dataproduct
│       │   domain02.datacontract.0.1.yml
│       │   domain02.datacontract.0.1.html
│       │   ...
│
```

## Useful Links

- [REST Origin - Roy Fielding](https://ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm)
- [Open API](https://www.openapis.org/)
  - [Open API Generator](https://openapi-generator.tech/)
- [Redoc](https://github.com/Redocly/redoc)
- [Open API Docusaurus - Best Tool](https://github.com/PaloAltoNetworks/docusaurus-template-openapi-docs)
  - [Open API Docusaurus - Other Examples](https://docusaurus-openapi.netlify.app/)
  - [Docusaurus Resources](https://docusaurus.io/community/resources)
  - [Good Fuse Github](https://github.com/fuseio/fuse-docs)
  - [Good Fuse Example](https://docs.fuse.io/api-introduction/)
  - [Open API Showcase](https://github.com/PaloAltoNetworks/docusaurus-openapi-docs/issues?q=is%3Aissue+is%3Aopen+multiple)
- [Open API Idea to Implementation](https://www.youtube.com/watch?v=JEBd78U9aBo&t=1728s&pp=ygUIb3BlbiBhcGk%3D)
- [Swagger VS Code](https://marketplace.visualstudio.com/items?itemName=42Crunch.vscode-openapi)
- [Swagger Code Gen](https://swagger.io/tools/swagger-codegen/)
- [Swagger Hub](https://swagger.io/tools/swaggerhub/)
- [Prism Mock API](https://docs.stoplight.io/docs/prism/674b27b261c3c-prism-overview)
- [Specmatic](https://specmatic.io/)
- [Semantic Versioning](https://semver.org/)
- [Arazzo - Sequence of Calls](https://github.com/OAI/Arazzo-Specification)

- [Async API](https://www.asyncapi.com/en)

  - [Async API VS Code](https://marketplace.visualstudio.com/items?itemName=asyncapi.asyncapi-preview)
  - [Async API Online Editor](https://studio.asyncapi.com/)

- [Data Contract](https://datacontract.com/)
  - [Data Contract CLI](https://cli.datacontract.com/)
  - [Data Contract GPT](https://gpt.datacontract.com/)
- [Open Data Product Specification](https://opendataproducts.org/)
- [Design APIs with Swagger and Open API](https://designapis.com/)

## Dictionary

- HTTP - Hypertext Transfer Protocol
- REST - Representational State Transfer
- URI - Uniform Resource Identifier

## Status Codes

- 1xx Informational
- 2xx Success
- 3xx Redirection
- 4xx Client Error
- 5xx Server Error

## Open API

```yaml
openapi: 3.0.0
security:
  - mySecurityRule: []
info:
  title: Sample API
  description: Optional multiline or single-line description in [CommonMark](http://commonmark.org/help/) or HTML.
  version: 0.1.0
servers:
  - url: http://api.example.com/v1
    description: Optional server description, e.g. Main (production) server
  - url: http://staging-api.example.com
    description: Optional server description, e.g. Internal staging server for testing
paths:
  /users:
    get:
      summary: Returns a list of users.
      description: Optional extended description in CommonMark or HTML.
      responses:
        '200':
          description: A JSON array of user names
          content:
            application/json:
              schema:
                type: array
                items:
                  type: string
```
