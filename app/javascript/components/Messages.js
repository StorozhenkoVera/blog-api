import React from "react"

class Room extends React.Component {
    render () {
        return (
            <React.Fragment>
                <textarea class='messages'></textarea>
                <button>Send</button>
            </React.Fragment>
        );
    }
}

export default Room