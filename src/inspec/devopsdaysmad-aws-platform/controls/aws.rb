# copyright: 2018, The Authors

title "sample section"


include_controls 'aws-mitre' do
  skip_control 'cis-aws-foundations-4.3'
  skip_control 'cis-aws-foundations-4.4'
  skip_control 'cis-aws-foundations-4.5'
end
