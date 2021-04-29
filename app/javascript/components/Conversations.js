import React from "react"
import PropTypes from "prop-types"
import { Router } from "react-router-dom"

class Conversations extends React.Component {
    render () {
        return (
            <React.Fragment>
                <textarea class='messages' >Area</textarea>
            </React.Fragment>
        );
    }
}

export default Conversations