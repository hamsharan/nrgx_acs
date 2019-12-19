import React from "react";
var NewPerson= React.createClass({
  handleClick() {
    var full_name = this.refs.full_name.value;
    var sin = this.refs.sin.value;
    var birthdate = this.refs.birthdate.value;
    $.ajax({
      url: "/api/v1/persons",
      type: "POST",
      data: { person: { full_name: full_name,sin: sin, birthdate: birthdate } },
      success: person => {
        this.props.handleSubmit(person);
      }
    });
  },
  render() {
      return (
          <div>
              <input ref='full_name' placeholder='Enter the full name of Person' />
              <input ref='sin' placeholder='Enter the Persons (sin) #' />
              <input ref='birthdate' placeholder='Enter the Persons birthdate ' />
                <button onClick={this.handleClick}>Submit</button>
            </div>
            )

      )
  }
});
