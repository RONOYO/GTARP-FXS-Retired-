import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { ThemeProvider } from 'styled-components';

import configureStore from './store/configureStore';
import theme from './theme';

import EditorApp from './containers/EditorApp';

ReactDOM.render(
  <Provider store={configureStore()}>
    <ThemeProvider theme={theme}>
      <EditorApp />
    </ThemeProvider>
  </Provider>,
  document.querySelector('#root')
);
