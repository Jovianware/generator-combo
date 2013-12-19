require.config({
  baseUrl: '..',
  packages: [
    {
      name: 'cs',
      location: 'support/require-cs',
      main: 'cs'
    },
    {
      name: 'coffee-script',
      location: 'support/coffee-script',
      main: 'index'
    },
    {
      name: 'combo',
      location: 'support/combo/src/combo'
    }
  ],
  paths: {
    'implement': 'support/combo/src/combo/implementations/web/index'
  }
});

require([
  'cs!combo/index',
], function (combo) {
  require(['<%= mainPrefix %>main'], function (main) {
    main();
  })
});
