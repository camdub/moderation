require 'spec_helper'

describe LimitLevel do
  it { expect(subject).to have_many(:category_histories) }
end