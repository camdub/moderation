require 'spec_helper'

describe Week do
  it { expect(subject).to have_many(:category_histories) }
end