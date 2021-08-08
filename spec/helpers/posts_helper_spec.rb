require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
  describe '#format_date' do
    it 'returns the correct date format from a date string' do
      expect(helper.format_date('2021-02-18 15:15:37 +0700')).to match('2021-02-18 15:15')
    end
  end

  describe '#truncate_post' do
    it 'returns the correct truncate post from a date string' do
      post = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada elit quis accumsan dapibus. Proin pellentesque urna quam, ut condimentum erat ultrices at. Integer fermentum dignissim urna. Aenean eget venenatis massa. Nam faucibus, tortor vel viverra porttitor, magna magna posuere nibh, non venenatis tortor leo non risus. Vestibulum aliquet magna ac blandit hendrerit. Donec congue lacinia purus non dignissim. Sed auctor quis diam ut pellentesque. Vestibulum ac lacus luctus, porta mi tempor, scelerisque est. Quisque ornare purus non libero convallis, in posuere turpis finibus. Aenean tristique sapien risus, ac auctor sapien blandit sed. Pellentesque at ligula massa. Donec accumsan ex id mi aliquam, a ultrices libero ullamcorper. Curabitur quis ipsum in est viverra consectetur.\n\nAenean et dapibus elit, a mattis ligula. Nullam eleifend, enim sed accumsan faucibus, nibh arcu scelerisque dolor, eu sollicitudin turpis justo id ex. Nulla sed fringilla nulla, vitae semper leo. Vivamus consectetur in urna id tincidunt. Maecenas rhoncus est nec orci molestie tempor. Sed at erat enim. Sed lobortis nisi ipsum, vel venenatis turpis aliquam nec. In condimentum auctor volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam libero purus, faucibus eu ligula ut, placerat aliquam lorem. Aenean aliquam condimentum est. Nam rhoncus mi augue, ut hendrerit lorem vehicula vel. Nam convallis non purus sit amet rutrum. Ut rutrum mi ut ex suscipit venenatis.\n\nVestibulum ut leo et dolor tempus cursus sed vel enim. Aenean at ante sit amet nisl dictum sodales. Aenean dignissim dignissim interdum. Aliquam non varius dui. Quisque tincidunt diam ut efficitur dapibus. Suspendisse mollis at tortor ut pulvinar. Mauris laoreet quam dui, a dignissim arcu sodales eu. Sed gravida posuere sem eu viverra. Cras id egestas erat. Ut dignissim elementum turpis, nec interdum nulla malesuada sit amet."
      expected_post = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada elit quis accumsan dapibus. Proin pellentesque urna quam, ut condimentum erat ultrices at. Integer fermentum dignissim urna. Aenean eget venenatis massa. Nam faucibus,...'
      expect(helper.truncate_post(post)).to match(expected_post)
    end
  end
end
