import React from 'react';

import Root from '../components/primitives/Root';
import DevTools from './DevTools';

export default () => (
  <Root isBrowser isVisible>
    <DevTools />
  </Root>
);
