require.config({
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
  ]
});

require([
  'main',
  'coffee-script'
], function(main) {
  main();
});
