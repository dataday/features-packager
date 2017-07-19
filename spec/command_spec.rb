# encoding: utf-8

require 'spec_helper'
require 'features/packager'

describe Features::Packager do
  it 'has a version number' do
    expect(Features::Packager::VERSION).not_to be nil
  end
end
