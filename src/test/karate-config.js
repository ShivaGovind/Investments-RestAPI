  function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    if (!env) {
      env = 'dev';
    }
    var config = {
    baseUrl: 'https://goldmanqavil.v3locitydev.com/api/v1/queries',
      };
    if (env == 'dev') {
      // customize
      // e.g. config.foo = 'bar';
//      // 'callSingle' is guaranteed to run only once even across all threads
//      var result = karate.callSingle('classpath:features/Token.feature', config);
//      // and it sets a variable called 'authInfo' used in headers-single.feature
//      config.authInfo = { authToken: result.token };
    } else if (env == 'e2e') {
      // customize
    }
    karate.configure('ssl', true);
    return config;
  }