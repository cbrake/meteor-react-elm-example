import React, { Component } from "react";

import LineChart from "./elm/LineChart.js";

export default class Graph extends React.Component {
  render() {
    console.log("LineChart: ", LineChart);
    return (
      <div className="time-container">
        <div>
          <h1>Chart: </h1>
          <Elm src={LineChart.Elm.Main} />
        </div>
      </div>
    );
  }
}
