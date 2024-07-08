import Component from "@ember/component";
import { fn } from "@ember/helper";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DiscourseURL from "discourse/lib/url";
import CustomIcon from "./custom-icon";

export default class CustomHeaderDropdown extends Component {
  @service site;
  @service router;

  @action
  redirectToUrl(url) {
    if (this.site.mobileView) {
      this.toggleHeaderLinks();
    }

    DiscourseURL.routeTo(url);
  }

  <template>
    <li
      class="custom-header-dropdown-link"
      title={{@item.title}}
      {{on "click" (fn this.redirectToUrl @item.url)}}
    >
      <CustomIcon @icon={{@item.icon}} />
      <span class="custom-header-link-title">{{@item.title}}</span>
      {{#if @item.description}}
        <span class="custom-header-link-desc">{{@item.description}}</span>
      {{/if}}
    </li>
  </template>
}