require File.dirname(__FILE__) + "/spec_helper"

describe "StaticMatic" do
  before do
    @tmp_dir = File.dirname(__FILE__) + '/sandbox/tmp'
    @staticmatic = StaticMatic::Base.new(@tmp_dir)
    @staticmatic.run('setup')
  end

  after do
    FileUtils.rm_r(@tmp_dir, :force => true)
  end

  describe "setup" do
    it "should set up project directory in given path" do
      %w(
      src/layouts/default.haml
      src/pages/index.haml
      src/stylesheets/screen.sass
      config/site.rb
      ).each do |path| 
        File.exists?(File.join(@tmp_dir, path)).should(be_true, "#{path} expected to exist in #{@tmp_dir}") 
      end
    end
  end
  
  describe "build" do

    it "should generate files to default path" do
      @staticmatic.run('build')
      %w(
      site/index.html
      site/stylesheets/screen.css
      ).each do |path| 
        File.exists?(File.join(@tmp_dir, path)).should(be_true, "#{path} expected to exist in #{@tmp_dir}") 
      end
    end
    
    # it "should generate files to configured path" do
    #   @staticmatic.configuration.site_path = "other" 
    #   @staticmatic.run('build')
    #   %w(
    #   other/index.html
    #   other/stylesheets/screen.css
    #   ).each do |path| 
    #     File.exists?(File.join(@tmp_dir, path)).should(be_true, "#{path} expected to exist in #{@tmp_dir}") 
    #   end
    # end
    
      
  end
    
end