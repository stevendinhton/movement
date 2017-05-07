var Movements = React.createClass({

  popularCards: function(){
    var popular = this.props.popular.map(function(movement){
      return(
        <div className="column" key={ movement.id }>
          <div className="card">
            <header className="card-header-title">
              { movement.title }
            </header>
            <div className="card-content">
              <div className="content">
                { movement.description.substring(0,300) }
                <br />
                <small>Followers: { movement.followers }</small>
              </div>
            </div>
            <footer className="card-footer">
              <a className="card-footer-item" href={ "/pages/" + movement.id }>View</a>
              <a className="card-footer-item" href={ "/follow/" + movement.id }>Follow</a>
            </footer>
          </div>
        </div>
      );
    });

    return <div className="columns">{ popular }</div>;
  },

  recentCards: function(){
    var recent = this.props.recent.map(function(movement){
      return(
        <div className="column" key={ movement.id }>
          <div className="card">
            <header className="card-header-title">
              { movement.title }
            </header>
            <div className="card-content">
              <div className="content">
                { movement.description.substring(0,300) }
                <br />
                <small>Followers: { movement.followers }</small>
              </div>
            </div>
            <footer className="card-footer">
              <a className="card-footer-item" href={ "/pages/" + movement.id }>View</a>
              <a className="card-footer-item" href={ "/follow/" + movement.id }>Follow</a>
            </footer>
          </div>
        </div>
      );
    });

    return <div className="columns">{ recent }</div>;
  },

  render: function() {
    return (
      <div>
        <h1 className="title is-2">Popular Movements</h1>
        { this.popularCards() }
        <h1 className="title is-2">Newest Movements</h1>
        { this.recentCards() }
      </div>
    );
  }
})
