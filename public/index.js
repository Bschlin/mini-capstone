/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: [],
      titleFilter: "",
      sortAttribute: "name",
      currentProduct: {
        name: "",
        price: "",
        description: ""
      }
    };
  },
  created: function() {
    axios.get("/v1/products").then(
      function(response) {
        this.products = response.data;
      }.bind(this)
    );
  },
  methods: {
    setCurrentProduct: function(inputProduct) {
      this.currentProduct = inputProduct;
    },
    isValidProduct: function(inputProduct) {
      var lowerInputName = inputProduct.name.toLowerCase();
      var lowerTitleFilter = this.titleFilter.toLowerCase();
      return lowerInputName.includes(lowerTitleFilter);
      // return inputProduct.name.includes(this.titleFilter);
    }
  },
  computed: {
    sortedProducts: function() {
      return this.products.sort(
        function(product1, product2) {
          // return recipe1.chef.localeCompare(recipe2.chef);
          var lowerAttribute1 = product1[this.sortAttribute].toLowerCase();
          var lowerAttribute2 = product2[this.sortAttribute].toLowerCase();
          return lowerAttribute1.localeCompare(lowerAttribute2);
        }.bind(this)
      );
    }
  }
};

var SamplePage = {
  template: "#sample-page",
  data: function() {
    return {
      message: "Welcome to Vue.js (sample page)!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var RecipesNewPage = {
  template: "#products-new-page",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.name,
        input_price: this.price,
        input_description: this.description
      };
      axios
        .post("/v1/product", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/sample", component: SamplePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/products/new", component: RecipesNewPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
