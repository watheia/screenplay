import cucumber from 'cypress-cucumber-preprocessor';
import browserify from '@cypress/browserify-preprocessor';

export default (on: (event: string, decorator: any) => void) => {
  const options = {
    ...browserify.defaultOptions,
    typescript: require.resolve('typescript'),
  };

  on('file:preprocessor', cucumber(options));
};
