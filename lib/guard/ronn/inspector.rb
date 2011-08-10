module Guard
  class Ronn
    module Inspector
      class << self
        def clean(paths)
          paths.uniq!
          paths.compact!
          clear_markdown_files_list_after do
            paths = paths.select { |path| markdown_file?(path) }
          end
          paths.reject { |p| included_in_other_path?(p, paths) }
        end

      private

        def markdown_file?(path)
          markdown_files.include?(path)
        end

        def markdown_files
          @markdown_files ||= Dir["man/*.{md,markdown}"]
        end

        def clear_markdown_files_list_after
          yield
          @markdown_files = nil
        end

        def included_in_other_path?(path, paths)
          (paths - [path]).any? { |p| path.include?(p) && path.sub(p, '').include?('/') }
        end

      end
    end
  end
end
