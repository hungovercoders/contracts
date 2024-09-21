import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "whiskey/whiskey-api",
    },
    {
      type: "category",
      label: "whiskey",
      link: {
        type: "doc",
        id: "whiskey/whiskey",
      },
      items: [
        {
          type: "doc",
          id: "whiskey/schemas/whiskey",
          label: "Whiskey",
          className: "schema",
        },
        {
          type: "doc",
          id: "whiskey/get-all-whiskeys",
          label: "Get all whiskeys",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "whiskey/add-whiskey",
          label: "Add a new whiskey",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "whiskey/get-a-whiskey",
          label: "Get a specific whiskey",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "whiskey/delete-a-whiskey",
          label: "Delete a specific whiskey",
          className: "api-method delete",
        }
      ],
    },
  ],
};

export default sidebar.apisidebar;
