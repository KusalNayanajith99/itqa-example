const { When, Then, Given } = require("@cucumber/cucumber");
const { expect } = require("@playwright/test");

When(
  "I make an unauthenticated {string} request to {string}",
  async function (method, endpoint) {
    // EXPLICTLY SETTING HEADERS TO EMPTY OBJECT
    const headers = {};

    switch (method.toUpperCase()) {
      case "GET":
        this.response = await this.apiContext.get(endpoint, {
          headers,
        });
        break;
      case "POST":
        this.response = await this.apiContext.post(endpoint, {
          headers,
          data: {
            title: "Test Book",
            author: "Test Author",
          },
        });
        break;
      case "PUT":
        this.response = await this.apiContext.put(endpoint, {
          headers,
          data: {
            title: "Updated Book",
            author: "Updated Author",
          },
        });
        break;
      case "DELETE":
        this.response = await this.apiContext.delete(endpoint, {
          headers,
        });
        break;
    }
  }
);

Given(
  "I am authenticated with username {string} and password {string}",
  async function (username, password) {
    this.currentAuth = this.getAuthHeader(username, password);
  }
);
