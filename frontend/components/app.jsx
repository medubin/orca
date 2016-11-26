import React from 'react';
import NavBar from './navbar/navbar_container.js'
import Footer from './footer/footer_container.js'
import Search from './search/search_container.js'



const App = ({}) => (
  <div>
  <header>
    <NavBar />
  </header>
  <Search/>
    <footer>
      <Footer />
    </footer>
  </div>


);

export default App;
