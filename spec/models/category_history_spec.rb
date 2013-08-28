require 'spec_helper'

describe CategoryHistory do
  it { expect(subject).to belong_to(:week) }
  it { expect(subject).to belong_to(:limit_level) }
  it { expect(subject).to belong_to(:category) }
end