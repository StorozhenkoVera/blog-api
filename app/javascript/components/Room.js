import React from "react"
import PropTypes from "prop-types"
import { Router } from "react-router-dom"

class Room extends React.Component {
  render () {
    return (
      <React.Fragment>
        <textarea class='messages' ></textarea>
        <input type='text'/>
        <button type='submit' action="/create_room">Send</button>
      </React.Fragment>
    );
  }
}

export default Room