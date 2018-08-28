import { createStore } from 'redux';
import DevTools from '../containers/DevTools';

const noopReducer = () => ({});
const enhancer = DevTools.instrument({ maxAge: 50 });

export default () => createStore(noopReducer, enhancer);
