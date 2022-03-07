import { Controller } from "stimulus"
import $ from 'jquery';

import "select2";
import 'select2/dist/css/select2.min.css';

export default class extends Controller {
  connect() {
     $(this.element).select2();
     $(document).on('select2:open', () => {
      document.querySelector('.select2-search__field').focus();
    });
  }
}
