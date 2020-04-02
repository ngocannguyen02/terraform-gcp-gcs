# see https://github.com/inspec/inspec-gcp/blob/master/docs/resources/google_storage_buckets.md
title 'Google Cloud Storage bucket creation test'

outputs = inspec.profile.file('terraform-output.json')
params = JSON.parse(outputs)
BUCKET_PROJECT_ID = params['bucket_project_id']['value']
BUCKET_NAME = params['bucket_name']['value']
BUCKET_LOCATION = params['bucket_location']['value']
BUCKET_STORAGE_CLASS = params['bucket_storage_class']['value']
BUCKET_SELF_LINK = params['bucket_self_link']['value']

control 'Check google_project configuration' do
  impact 1.0
  title 'Ensure GCP project already exists'
  describe google_project(project: BUCKET_PROJECT_ID) do
    it { should exist }
    its('lifecycle_state') { should eq 'ACTIVE' }
  end
end

control 'Check google_storage_bucket configuration' do
  impact 1.0
  title 'Ensure GCS bucket is created properly'
  describe google_storage_bucket(name: BUCKET_NAME) do
    it { should exist }
    its('name') { should eq BUCKET_NAME }
    its('location') { should eq BUCKET_LOCATION }
    its('storage_class') { should eq BUCKET_STORAGE_CLASS }
    its('self_link') { should eq BUCKET_SELF_LINK }
  end
end


