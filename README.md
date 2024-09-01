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

## Containerize Docs

- [Containerize Docs](https://shipyard.build/blog/containerize-your-docs/)
- [Static Web App deploy](https://www.azurestaticwebapps.dev/blog/build-with-docusaurus)

## Useful Links

- [REST Origin - Roy Fielding](https://ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm)
- [Open API](https://www.openapis.org/)
  - [Open API Lifecycle](https://www.openapis.org/wp-content/uploads/sites/3/2023/05/What-is-OpenAPI-Simple-API-Lifecycle-Vertical.png)
  - [Open API Generator](https://openapi-generator.tech/)
- [Redoc](https://github.com/Redocly/redoc)
- [Open API Fundamentals Course](https://training.linuxfoundation.org/express-learning/openapi-fundamentals-lfel1011)
  - [Open API Fundamentals Course Github](https://github.com/lftraining/LFELL1011-resources/tree/main)
  - [Semantic Versioning](https://semver.org/)
  - [Doc Ops](https://www.writethedocs.org/guide/doc-ops/)
  - [Zuora Dev Example API Spec](https://developer.zuora.com/v1-api-reference/introduction/)
  - [Kiota - Generate Client](https://learn.microsoft.com/en-us/openapi/kiota/)
    - [Kiota Quick Starts](https://learn.microsoft.com/en-us/openapi/kiota/quickstarts/)
  - [Spectral](https://stoplight.io/open-source/spectral) - Open API linting and governance.
    - [Spectral Setup Example](https://github.com/lftraining/LFELL1011-resources/blob/main/chapter-5-examples/applying-governance/README.md)
    - [Spectral Real-World Rulesets](https://docs.stoplight.io/docs/spectral/674b27b261c3c-overview#-real-world-rulesets)
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
- [API Blueprint](https://apiblueprint.org/)
- [Design APIs with Swagger and Open API](https://designapis.com/)

- [Arazzo - Sequence of API Calls](https://github.com/OAI/Arazzo-Specification)

- [pact](https://pact.io/)

- [Async API](https://www.asyncapi.com/en)

  - [Async API VS Code](https://marketplace.visualstudio.com/items?itemName=asyncapi.asyncapi-preview)
  - [Async API Online Editor](https://studio.asyncapi.com/)

- [Data Contract](https://datacontract.com/)
  - [Data Contract CLI](https://cli.datacontract.com/)
  - [Data Contract GPT](https://gpt.datacontract.com/)
- [Open Data Product Specification](https://opendataproducts.org/)
- [Data Contracts: Creating APIs for Your Data](https://www.youtube.com/watch?v=qYl21EWNL44&t=43s)
- [Drivng Data Quality with Data Contracts](https://www.amazon.co.uk/Driving-Data-Quality-Contracts-comprehensive-ebook/dp/B0C37FPH3D)
- [Bitol](https://bitol.io/)
- [soda](https://www.soda.io/)
- [great expectations](https://greatexpectations.io/)
- [data contract online editor](https://editor.datacontract.com/)
- [data contract gpt](https://gpt.datacontract.com/)
- [data contract json schema](https://datacontract.com/datacontract.schema.json)

- [APIs and Data Closer Together](https://www.youtube.com/watch?v=4FzpJ6CDro4)


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
  - mySecurityRule: [ ]
info:
  title: Sample API
  description: Optional multiline or single-line description in [CommonMark](http://commonmark.org/help/) or HTML.
  version: 0.1.0
servers:
  - url: http://api.example.com/v1
    description: Optional server description, e.g. Main (production) server
  - url: http://staging-api.example.com
    description: Optional server description, e.g. Internal staging server for testing
paths: ## Paths Object
  /users: ## Path Item Object has GET, POST etc
    get: ## Operation Object has a summary description etc
      summary: Returns a list of users.
      description: Optional extended description in CommonMark or HTML.
      responses:  ## Responses Object as 200, 404 etc
        '200': ## Response Object has description, content etc
          description: A JSON array of user names
          content:
            application/json:
              schema:
                type: array
                items:
                  type: string
components:
  securitySchemes:
    mySecurityRule:
      type: http
      scheme: bearer
```
