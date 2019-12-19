import React from "react";
var AllPersons = React.createClass({
  render() {
    var persons = this.props.persons.map(person => {
      return (
        <div key={person.id}>
            <h3>{person.full_name}</h3>
            <p>{person.sin}</p>
            <p>{person.birthdate}</p>
        </div>
      );
    });

    return <div>{persons}</div>;
  }
});
