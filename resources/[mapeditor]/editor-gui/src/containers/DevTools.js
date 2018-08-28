import React from 'react';

/* eslint-disable import/no-extraneous-dependencies */
import { createDevTools } from 'redux-devtools';
import DockMonitor from 'redux-devtools-dock-monitor';
import MultipleMonitors from 'redux-devtools-multiple-monitors';
import LogMonitor from 'redux-devtools-log-monitor';
import Dispatcher from 'redux-devtools-dispatch';
/* eslint-enable import/no-extraneous-dependencies */

export default createDevTools(
  <DockMonitor
    defaultIsVisible={false}
    toggleVisibilityKey="ctrl-h"
    changePositionKey="ctrl-q"
  >
    <MultipleMonitors>
      <LogMonitor />
      <Dispatcher
        actionCreators={{}}
        initEmpty
      />
    </MultipleMonitors>
  </DockMonitor>
);
