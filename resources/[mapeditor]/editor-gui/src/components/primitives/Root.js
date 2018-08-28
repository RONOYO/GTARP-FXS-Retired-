import styled, { css } from 'styled-components';
import PropTypes from 'prop-types';

const opacity = props => +(props.isVisible || props.isBrowser);

const Root = styled.div`
  opacity: ${opacity};
  width: 100%;
  height: 100%;
  overflow: hidden;
  transition: opacity 100ms ease-out;

  ${props => props.isBrowser && css`
    background-image: url('/public/images/ingame.jpg');
    background-size: cover;
    background-position: center center;
  `}
`;

Root.propTypes = {
  isBrowser: PropTypes.bool.isRequired,
  isVisible: PropTypes.bool.isRequired
};

export default Root;
