import React from "react";

var Body = React.createClass({
  getInitialState() {
    return { {persons}: [] };
  },

  componentDidMount() {
    $.getJSON("/api/v1/{persons}.json", response => {
      this.setState({ {persons}: response });
    });
  },

  handleSubmit(person) {
    var newState = this.state.{persons}.concat(person);
    this.setState({ {persons}: newState });
  },

  render() {
    return (
      <div>
        <NewPerson handleSubmit={this.handleSubmit} />
        <All{Persons} {persons}={this.state.{persons}} />
      </div>
    );
  }
});
