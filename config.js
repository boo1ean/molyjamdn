var dojoConfig = {
  baseUrl: './',
  packages: [
    { name: 'dojo', location: 'deps/dojo' },
    { name: 'dcl', location: 'deps/dcl', main: 'dcl' },
    { name: 'lodash', location: 'deps/lodash/dist', main: 'lodash' },
    { name: 'hammer', location: 'deps/hammer/dist', main: 'hammer' },
    { name: 'frozen', location: 'deps/frozen/src', main: 'GameCore' },
    { name: 'game', location: 'src/js', main: 'game' }
  ],
  deps: ['game'],
  async: true
};
