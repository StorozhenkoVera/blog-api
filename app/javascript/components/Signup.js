import React from "react"

class Signup extends React.Component {
    render () {
        return (
            <React.Fragment>
                <form action='/users' method='POST'>
                    <p>Enter your nickname</p>
                    <input type='text' name="name"/>
                    <button type='submit'>Signup</button>
                </form>
            </React.Fragment>
        );
    }
}
export default Signup