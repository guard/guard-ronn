module Guard
  class Ronn
    module Inspector
      class << self
        def clean(paths)
          paths.uniq!
          paths.compact!
          clear_ronn_files_list_after do
            paths = paths.select { |path| ronn_file?(path) }
          end
          paths.reject { |p| included_in_other_path?(p, paths) }
        end

      private

        def ronn_file?(path)
          ronn_files.include?(path)
        end

        def ronn_files
          @ronn_files ||= Dir["man/*.{ronn,md,markdown}"]
        end

        def clear_ronn_files_list_after
          yield
          @ronn_files = nil
        end

        def included_in_other_path?(path, paths)
          (paths - [path]).any? { |p| path.include?(p) && path.sub(p, '').include?('/') }
        end

      end
    end
  end
end
