window.FormElementTypeSelector = React.createClass({
  getInitialState: function() {
    console.log(this.props);
    return {selectedValue: this.props.selectedValue};
  },
  registerChange: function(event){
    console.log(event.target.value);
    this.setState({selectedValue: event.target.value});
  },
  render: function() {
    var options = this.props.availableOptions.map( function (option, index){
      var label  = (option.label == undefined ? option.value : option.label);
      return (<option value={option.value} key={index}>{label}</option>);
    }.bind(this) );

    return (<select
        name={this.props.attributeName}
        className="form-control"
        onChange={this.registerChange}
        defaultValue={this.state.selectedValue}>
        <option>Select type</option>
        {options}
        </select>);
  }
});