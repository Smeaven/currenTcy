import Model from '../models/dashboard';

const m = require('mithril');

export default class Dashboard {
  oninit() {
    this.model = new Model();
  }
  view() {
    this.stfuEslint = true;
    return m('.container-fluid', [
      m('nav.navbar', [
        m('span.navbar-brand', [
          m('img', { src: '../img/currentcy.png' }),
        ]),
        m('ul.navbar-nav', [
          m('li.nav-item.ml-auto', [
            m('a', { href: `https://etherscan.io/address/${this.model.currentAccount}` }, this.model.currentAccount),
          ]),
        ]),
      ]),
      m('.jumbotron', [
        m('.d-flex.justify-content-center.align-items-center', [
          m('img.mr-3', { src: './img/currentcy_logo.png' }),
          m('div', [
            m('h5.display-5', 'Ihr aktuelles Energie-Budget'),
            m('h1.display-1', `${this.model.balance} Wh`),
          ]),
        ]),
      ]),
    ]);
  }
}
