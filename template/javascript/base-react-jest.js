import React from "react";
import { mount } from "enzyme";

test("renders learn react link", () => {
  // shallow is not working
  // https://github.com/emotion-js/emotion/issues/1372
  const wrapper = mount();
  expect(wrapper.find().length).toBe(1);
});
